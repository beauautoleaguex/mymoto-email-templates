# Image Replacement Guide

## Current Image URLs to Replace

Once you have the images downloaded from Figma, replace the placeholder URLs in the template with your CDN URLs:

### Logo Images
1. **Main MyMoto Logo** (101x42px)
   - Current: `https://via.placeholder.com/101x42/008077/ffffff?text=MyMoto`
   - Replace with: Your CDN URL for `logo-mymoto.png`

2. **MyMoto Rewards Logo - Large** (400x66px)
   - Current: `https://via.placeholder.com/400x66/003147/ffffff?text=MyMoto+Rewards`
   - Replace with: Your CDN URL for the combined logo
   - Note: This is the brand banner logo with gradient background

3. **MyMoto Rewards Logo - Footer** (254x42px)
   - Current: `https://via.placeholder.com/254x42/008077/ffffff?text=MyMoto+Rewards`
   - Replace with: Your CDN URL for the footer logo

### Social Media Icons
All social icons should be replaced with actual icon images:

1. **Facebook** (11x19px)
   - Current: `https://via.placeholder.com/11x19/4e6873/4e6873?text=+`
   - Replace with: `icon-facebook.png`

2. **Twitter** (19x15px)
   - Current: `https://via.placeholder.com/19x15/4e6873/4e6873?text=+`
   - Replace with: `icon-twitter.png`

3. **Instagram** (19x19px)
   - Current: `https://via.placeholder.com/19x19/4e6873/4e6873?text=+`
   - Replace with: `icon-instagram.png`

4. **LinkedIn** (19x18px)
   - Current: `https://via.placeholder.com/19x18/4e6873/4e6873?text=+`
   - Replace with: `icon-linkedin.png`

5. **YouTube** (21x15px)
   - Current: `https://via.placeholder.com/21x15/4e6873/4e6873?text=+`
   - Replace with: `icon-youtube.png`

## Figma Image Mapping

From the Figma file, these are the assets needed:

### Component Assembly
The MyMoto Rewards logo is composed of multiple parts:
- `logo-my-dark.png` + `logo-moto-dark.png` = Dark version
- `logo-my-white.png` + `logo-moto-white.png` = White version  
- `logo-rewards.png` = "rewards" badge

You may need to:
1. Combine these in an image editor
2. Or use table-based layout to position them correctly

## Image Optimization

Before uploading to your CDN:

1. **Compress PNG files**
   - Use TinyPNG or ImageOptim
   - Aim for <50KB per image

2. **Create @2x versions**
   - Double the dimensions for retina displays
   - Name them with @2x suffix

3. **Test loading speed**
   - Total email should be <100KB
   - Images should load in <3 seconds

## CDN Setup

Recommended CDN services:
- **Cloudinary**: Auto-optimization and transformation
- **Imgix**: Real-time image processing
- **AWS S3 + CloudFront**: Full control
- **Your web server**: Simple solution

### Example CDN URLs
```
https://cdn.example.com/email/mymoto/logo-mymoto.png
https://cdn.example.com/email/mymoto/logo-mymoto@2x.png
https://cdn.example.com/email/mymoto/icons/facebook.png
```

## Final Steps

1. Replace all placeholder URLs in the template
2. Test image loading in email clients
3. Verify alt text is descriptive
4. Check total email size
5. Send test emails to multiple clients