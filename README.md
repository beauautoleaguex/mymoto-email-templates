# MyMoto Email Templates

Email templates designed with Figma and built for cross-client compatibility using Claude Code and Figma's MCP server.

## Quick Start

1. Design email in Figma (600px width)
2. Set up Figma MCP server and Claude Code
3. Generate template from Figma design
4. Export and integrate assets
5. Prepare for Mailchimp import

## Project Structure

```
/templates
  /transactional    # Order confirmations, password resets
  /marketing        # Newsletters, promotions
/assets
  /images          # Optimized images (@1x and @2x)
/tests             # Test files with sample data
/docs              # Documentation guides
/mailchimp-exports # Ready-to-import ZIP files
prepare-for-mailchimp.sh  # Export script
```

## Complete Workflow Guide

### 1. Setting Up Figma MCP Server

The Figma MCP (Model Context Protocol) server allows Claude Code to directly access your Figma designs and generate code.

**Prerequisites:**
- Figma desktop app installed
- Claude Code desktop app installed
- Active Figma file open

**Setup Steps:**
1. Open your Figma design file in the Figma desktop app
2. Enable Dev Mode in Figma (Shift + D)
3. The MCP server runs automatically when Figma is open
4. In Claude Code, the Figma tools will be available when a design is selected

### 2. Designing Email Templates in Figma

**Design Requirements:**
- **Width**: Set frame to exactly 600px wide
- **Structure**: Use clear visual hierarchy
- **Images**: Export at 2x for retina displays
- **Typography**: Use web-safe fonts or system fonts
- **Spacing**: Consistent padding and margins

**Best Practices:**
- Group related elements
- Name layers descriptively
- Use Figma's auto-layout for consistent spacing
- Keep designs simple and single-column for mobile

### 3. Generating Templates with Claude Code

**Step 1: Select Your Design**
```
1. In Figma, select the email frame
2. Copy the Figma URL or note the frame
3. Example: https://www.figma.com/design/[file-id]?node-id=[node-id]
```

**Step 2: Generate with Claude Code**
```
1. Open Claude Code
2. Provide the Figma URL or mention the selected frame
3. Request: "Generate an email template from this Figma design"
4. Claude will use mcp__figma-dev-mode-mcp-server__get_code
```

**Step 3: Review Generated Code**
- Table-based layout for compatibility
- Inline CSS for email clients
- Mobile-responsive design
- Proper image dimensions

### 4. Exporting and Managing Assets

**Automatic Asset Detection:**
When generating templates, Claude Code identifies all required images from the Figma design.

**Manual Asset Export:**
1. In Figma, select the frame with your email design
2. Export images at 2x resolution for retina displays
3. Save to `assets/images/` with descriptive names
4. Include both PNG (for emails) and SVG (for reference)

**Asset Naming Convention:**
```
logo-mymoto.png          # 1x version
logo-mymoto@2x.png       # 2x version (used in emails)
logo-mymoto.svg          # Vector version
```

**Handling Complex Assets:**
- Torn paper effects
- Gradient overlays
- Combined logos
- Social media icons

### 5. Preparing for Mailchimp

**Using the Export Script:**
```bash
# Make script executable (first time only)
chmod +x prepare-for-mailchimp.sh

# Export any template
./prepare-for-mailchimp.sh template-name

# Example
./prepare-for-mailchimp.sh rewards-launch
```

**What the Script Does:**
1. Creates a Mailchimp-compatible version
2. Adds required merge tags:
   - `*|UNSUB|*` for unsubscribe links
   - `*|CURRENT_YEAR|*` for copyright year
   - `*|LIST:COMPANY|*` for company name
3. Copies all required images
4. Creates ZIP file under 1MB
5. Outputs to `mailchimp-exports/`

**Manual Import to Mailchimp:**
1. Log into Mailchimp
2. Go to Templates → Create Template
3. Select "Code your own"
4. Choose "Import ZIP"
5. Upload the generated ZIP file

### 6. Testing Email Templates

**Local Testing:**
1. Open HTML file in browser
2. Resize to test responsive design
3. Check all images load correctly

**Email Client Testing:**
- Use Litmus or Email on Acid
- Test priority clients:
  - Gmail (web and mobile)
  - Outlook (2016, 2019, 365)
  - Apple Mail
  - Mobile clients

**Testing Checklist:**
- [ ] Images display correctly
- [ ] Links work properly
- [ ] Mobile responsive
- [ ] Text is readable
- [ ] Unsubscribe link present

## Email Template Guidelines

### Technical Requirements
- **Max width**: 600px
- **Layout**: Table-based for compatibility
- **CSS**: Inline styles only
- **Images**: PNG format, hosted by Mailchimp
- **File size**: Under 100KB HTML, under 1MB ZIP

### Design Best Practices
- Single column on mobile
- 14px minimum font size
- 44x44px minimum tap targets
- High contrast text
- Alt text for all images

### Figma to Email Considerations
- Figma effects may need simplification
- Gradients should be CSS-based when possible
- Custom fonts require fallbacks
- Shadows may not render in all clients

## Development Workflow

1. **Create feature branch**: 
   ```bash
   git checkout -b feature/template-name
   ```

2. **Design in Figma**:
   - Set 600px width
   - Follow email design guidelines
   - Export assets at 2x

3. **Generate with Claude Code**:
   - Select Figma frame
   - Request template generation
   - Review and refine output

4. **Integrate Assets**:
   - Export from Figma
   - Update image paths
   - Test locally

5. **Prepare for Production**:
   ```bash
   ./prepare-for-mailchimp.sh template-name
   ```

6. **Test and Deploy**:
   - Test across clients
   - Import to Mailchimp
   - Send test campaigns

## Troubleshooting

### Common Issues

**Figma MCP Connection:**
- Ensure Figma desktop app is running
- Select a frame before requesting code
- Check Dev Mode is enabled (Shift + D)

**Image Export Issues:**
- Figma localhost URLs are session-specific
- Always manually export final assets
- Use @2x versions for clarity

**Mailchimp Import:**
- ZIP must be under 1MB
- All files in root directory
- Include *|UNSUB|* tag

### Getting Help

- **Figma MCP Issues**: Check if Figma is running and frame is selected
- **Template Issues**: Review email best practices in `/docs`
- **Mailchimp Issues**: Verify merge tags and file structure

## Resources

- [Email Template Best Practices](docs/email-best-practices.md)
- [Figma Workflow Guide](docs/figma-workflow.md)
- [Email Testing Guide](docs/email-testing-guide.md)
- [Mailchimp Template Language](https://mailchimp.com/help/all-the-merge-tags-cheat-sheet/)