Great! Here's a **complete working example** of using **Uppy + Rails + S3 Multipart Uploads** for uploading large files (like 100GB) **directly from the browser** to S3, with a nice UI, pause/resume, and progress tracking.

---

## ✅ What This Includes

* Uppy UI for large file upload
* Multipart uploads to S3 (resumable)
* Backend endpoint in Rails to generate presigned multipart URLs
* No background job required
* Optional: Notify or save metadata in Rails DB

---

## 🧱 Prerequisites

* AWS S3 bucket
* Rails app
* `aws-sdk-s3` gem installed

---

## 1. 🔧 Set Up AWS S3 for Multipart Uploads

Ensure your bucket policy allows multipart uploads. You’ll be generating **presigned URLs** to allow the browser to upload chunks directly.

---

## 2. 💎 Install Required Gems

Add to your `Gemfile`:

```ruby
gem 'aws-sdk-s3'
```

Run:

```bash
bundle install
```

---

## 3. 🛠️ Create a Controller to Handle Multipart Presign Requests

```ruby
# app/controllers/uploads_controller.rb
class UploadsController < ApplicationController
  def presign_multipart
    s3 = Aws::S3::Resource.new(region: ENV['AWS_REGION'])
    bucket = s3.bucket(ENV['AWS_BUCKET'])

    object_key = "uploads/#{SecureRandom.uuid}/#{params[:filename]}"

    signer = Aws::S3::Presigner.new

    url = signer.presigned_url(:create_multipart_upload,
      bucket: bucket.name,
      key: object_key,
      content_type: params[:type]
    )

    render json: {
      upload_url: url,
      key: object_key
    }
  end
end
```

---

## 4. 📡 Add Route

```ruby
# config/routes.rb
post 'uploads/presign_multipart', to: 'uploads#presign_multipart'
```

---

## 5. 🌐 Add Uppy to Your Frontend

Use Uppy via a CDN or npm (Webpacker or importmaps):

### CDN (simplest way):

In `app/views/layouts/application.html.erb`:

```html
<head>
  <!-- Uppy CSS -->
  <link href="https://releases.transloadit.com/uppy/v3.0.0/uppy.min.css" rel="stylesheet">
</head>
<body>
  <!-- Upload UI -->
  <div id="upload-area"></div>

  <!-- Uppy Scripts -->
  <script src="https://releases.transloadit.com/uppy/v3.0.0/uppy.min.js"></script>

  <script>
    document.addEventListener("DOMContentLoaded", () => {
      const uppy = new Uppy.Core({ debug: true, autoProceed: true })
        .use(Uppy.Dashboard, {
          inline: true,
          target: '#upload-area',
          showProgressDetails: true,
          proudlyDisplayPoweredByUppy: false
        })
        .use(Uppy.AwsS3Multipart, {
          createMultipartUpload(file) {
            return fetch("/uploads/presign_multipart", {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
              },
              body: JSON.stringify({
                filename: file.name,
                type: file.type
              })
            }).then(response => response.json());
          }
        });

      uppy.on('upload-success', (file, response) => {
        console.log("Upload complete:", file, response);
        // Optional: send object key to your backend for saving
      });
    });
  </script>
</body>
```

---

## 6. ✅ Test It

* Start your Rails server.
* Open the page with the Uppy dashboard.
* Select a large file (even 10–100 GB).
* It will upload in **multipart chunks** to S3.
* You’ll see upload progress and success message.

---

## ✅ Optional: Save Metadata to DB

You can add a model (e.g., `Upload`) and after upload-success, make a JS `POST` to save `key`, `filename`, etc., for later access or processing.

---

## 🔐 Security Tip

You may want to:

* **Authenticate the user** before giving presigned URLs.
* Limit allowed file types/sizes.
* Set a TTL on the multipart upload URL (AWS default is 7 days).

---

## 🧪 Want a more advanced setup?

Let me know if you'd like:

* Using `Shrine` instead of ActiveStorage
* Auto-expiring uploaded files
* Integration with Lambda or transcoding

Would you like me to generate a working GitHub example repo for this?
