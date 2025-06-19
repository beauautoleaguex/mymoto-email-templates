# Email Image Best Practices

## Image Format Support

### Recommended Formats
- **PNG**: Best for logos, icons, and images with transparency
- **JPG**: Best for photographs and complex images
- **GIF**: Supported everywhere but limited to 256 colors

### Avoid These Formats
- **SVG**: Not supported in most email clients (Outlook, Gmail app, etc.)
- **WebP**: Limited support
- **AVIF**: No email client support

## Email Client SVG Support

| Client | SVG Support |
|--------|------------|
| Apple Mail | ✅ Yes |
| Gmail Web | ✅ Yes |
| Gmail App | ❌ No |
| Outlook 2016-2021 | ❌ No |
| Outlook.com | ❌ No |
| Yahoo Mail | ⚠️ Partial |
| iOS Mail | ✅ Yes |
| Android Mail | ❌ No |

## Image Optimization

### Size Guidelines
- **File size**: Keep under 100KB per image
- **Total email size**: Keep under 100KB total
- **Dimensions**: Use actual display size (don't scale down large images)
- **Retina**: Provide 2x versions for high-DPI displays

### Implementation
```html
<!-- Standard resolution -->
<img src="logo.png" width="200" height="50" alt="Logo">

<!-- With retina support -->
<img src="logo@2x.png" width="200" height="50" alt="Logo" style="width:200px; height:50px;">
```

## Converting SVG to PNG

### Using ImageMagick
```bash
# Convert SVG to PNG
convert -background none input.svg output.png

# Convert with 2x resolution for retina
convert -background none -density 288 input.svg output@2x.png
```

### Using rsvg-convert
```bash
# Standard resolution
rsvg-convert -b none input.svg -o output.png

# 2x resolution
rsvg-convert -b none -d 288 -p 288 input.svg -o output@2x.png
```

## Image Hosting

### Options
1. **CDN**: Use services like Cloudinary, Imgix
2. **Your server**: Host on your domain for better deliverability
3. **Email service**: Some ESPs provide image hosting

### Best Practices
- Use HTTPS URLs
- Set proper cache headers
- Monitor image loading rates
- Have fallback alt text

## HTML Implementation

### Basic Image
```html
<img src="https://example.com/images/logo.png" 
     width="200" 
     height="50" 
     alt="MyMoto Rewards" 
     style="display:block; border:0; outline:none; text-decoration:none;">
```

### With Fallback Background Color
```html
<td style="background-color:#008077;">
    <img src="https://example.com/images/hero.png" 
         width="600" 
         height="300" 
         alt="Special Offer" 
         style="display:block; width:100%; max-width:600px; height:auto;">
</td>
```

### Bulletproof CTA Button (No Images)
```html
<table role="presentation" cellspacing="0" cellpadding="0" border="0">
    <tr>
        <td style="background-color:#008077; border-radius:4px;">
            <a href="https://example.com" 
               style="display:inline-block; padding:12px 24px; color:#ffffff; text-decoration:none;">
                Shop Now
            </a>
        </td>
    </tr>
</table>
```

## Testing Images

### Checklist
- [ ] Images load with images disabled
- [ ] Alt text displays properly
- [ ] File sizes are optimized
- [ ] Links on images work
- [ ] Images scale properly on mobile
- [ ] Background colors show when images are blocked

### Tools
- Litmus Email Testing
- Email on Acid
- Mail Tester (checks spam score)
- Browser developer tools (disable images)