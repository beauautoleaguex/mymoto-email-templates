# Email Testing Guide

## Local Testing

1. **Open Test File**: Navigate to `tests/rewards-launch-test.html` in your browser
2. **Check Rendering**: Verify the email displays correctly
3. **Test Responsiveness**: Resize browser window to check mobile view

## Email Client Testing Tools

### Recommended Services
- **Litmus**: Test across 90+ email clients
- **Email on Acid**: Pre-deployment testing
- **Mail Tester**: Check spam score

### Manual Testing
1. Send test emails to:
   - Gmail (personal & workspace)
   - Outlook.com
   - Yahoo Mail
   - Apple Mail

## Testing Checklist

### Visual
- [ ] Logo displays correctly
- [ ] Images load with proper dimensions
- [ ] Background colors render
- [ ] Fonts fallback gracefully
- [ ] Buttons are clickable

### Mobile
- [ ] Single column layout on mobile
- [ ] Text is readable (min 14px)
- [ ] CTAs are tap-friendly (44x44px min)
- [ ] No horizontal scrolling

### Content
- [ ] All links work
- [ ] Alt text present
- [ ] Preheader text displays
- [ ] Subject line under 50 chars

### Technical
- [ ] HTML validates
- [ ] File size under 100KB
- [ ] Images optimized
- [ ] No JavaScript
- [ ] Inline CSS only

## Common Issues & Fixes

### Outlook
- Table-based layouts required
- Use conditional comments for fixes
- Avoid CSS3 properties

### Gmail
- Removes <style> tags in some clients
- Clips emails over 102KB
- Blocks images by default

### Mobile
- Use media queries with !important
- Stack columns using display:block
- Increase font sizes for readability