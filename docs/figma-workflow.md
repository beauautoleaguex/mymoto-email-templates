# Figma Workflow for Email Templates

## Complete Guide to Figma + Claude Code Integration

### Prerequisites

1. **Figma Desktop App** (required for MCP server)
   - Download from [figma.com/downloads](https://figma.com/downloads)
   - Sign in to your Figma account
   - Keep the app running during development

2. **Claude Code Desktop App**
   - Ensure you have the latest version
   - The Figma MCP integration is built-in

3. **Enable Dev Mode**
   - Open your design in Figma
   - Press `Shift + D` to enable Dev Mode
   - This activates the MCP server connection

## Setting Up Your Email Design

### 1. Create Email Frame

```
Width: 600px (fixed)
Height: Auto
Background: #FFFFFF
Name: "Email - [Template Name]"
```

### 2. Design Structure

**Header Section (required)**
- Logo: 100-200px width
- Padding: 32px

**Content Sections**
- Heading: 24-36px font size
- Body text: 16-18px font size
- Line height: 1.5x
- Paragraph spacing: 16-24px

**CTA Buttons**
- Height: 44px minimum
- Padding: 16px 32px
- Border radius: 4-8px
- High contrast colors

**Footer Section (required)**
- Unsubscribe link
- Company info
- Social icons
- Copyright text

### 3. Design Best Practices

**Typography**
- Primary font: System fonts (Helvetica, Arial)
- Fallback stack: sans-serif
- Minimum size: 14px on mobile
- Color contrast: 4.5:1 minimum

**Images**
- Export at 2x for retina
- Use PNG format
- Optimize file sizes
- Add descriptive names

**Layout**
- Single column for mobile
- 32px side padding
- 24-48px section spacing
- Center align for Outlook

## Using Figma MCP with Claude Code

### Step 1: Prepare Your Design

1. Complete your email design in Figma
2. Ensure all elements are properly named
3. Group related elements logically
4. Set frame to exactly 600px width

### Step 2: Connect Claude Code

1. **In Figma:**
   - Select your email frame
   - Enable Dev Mode (Shift + D)
   - Copy the frame URL or note the selection

2. **In Claude Code:**
   ```
   "Generate an email template from the selected Figma frame"
   or
   "Create email HTML from: [Figma URL]"
   ```

### Step 3: MCP Tools Available

Claude Code can access these Figma tools:
- `get_code` - Generates HTML/CSS from design
- `get_image` - Views the design visually
- `get_variable_defs` - Gets color/spacing variables
- `get_code_connect_map` - Maps to components

### Step 4: Review Generated Code

The MCP server generates:
- Table-based HTML structure
- Inline CSS styles
- Proper email markup
- Image placeholders

## Asset Export Workflow

### Automatic Asset Detection

When generating templates, Claude Code will:
1. Identify all images in the design
2. List required assets
3. Generate proper img tags
4. Note localhost placeholder URLs

### Manual Asset Export

1. **Select Image Layer**
   - Click on each image in Figma
   - Check the right sidebar

2. **Export Settings**
   ```
   Format: PNG
   Scale: 1x and 2x
   Suffix: @2x for retina
   Background: Transparent
   ```

3. **Naming Convention**
   ```
   logo-company.png        # Standard
   logo-company@2x.png     # Retina
   icon-facebook.png       # Icons
   hero-banner.png         # Heroes
   ```

4. **Special Assets**
   - **Torn paper effects**: Export with transparency
   - **Gradients**: Use CSS when possible
   - **Combined logos**: Export as single image
   - **Icons**: Maintain consistent sizes

### Asset Organization

```
assets/images/
├── logo-mymoto.png
├── logo-mymoto@2x.png
├── logo-mymoto.svg
├── icons/
│   ├── icon-facebook@2x.png
│   └── icon-twitter@2x.png
└── effects/
    └── torn-paper@2x.png
```

## Troubleshooting Figma MCP

### Connection Issues

**"MCP tools not available"**
- Ensure Figma desktop app is running
- Check Dev Mode is enabled
- Select a frame in your design
- Restart Claude Code if needed

**"Cannot access design"**
- Verify you have edit access to the Figma file
- Ensure the file is open in Figma
- Try copying a fresh link

### Design to Code Issues

**"Layout looks different"**
- Email clients have limitations
- Complex effects may simplify
- Gradients become images or CSS
- Shadows may not render

**"Images not loading"**
- Figma localhost URLs are temporary
- Always export assets manually
- Update paths after export
- Use the @2x versions

### Best Practices for MCP

1. **Before Generating:**
   - Finalize your design
   - Group related elements
   - Name layers clearly
   - Set proper dimensions

2. **During Generation:**
   - Select the entire frame
   - Provide clear instructions
   - Review output carefully
   - Ask for adjustments

3. **After Generation:**
   - Export all assets
   - Update image paths
   - Test responsive behavior
   - Validate HTML output

## Advanced Techniques

### Component Variations

Create multiple states in Figma:
- Default state
- Hover state (for web preview)
- Mobile version
- Dark mode variant

### Design Tokens

Use Figma variables for:
- Brand colors
- Spacing units
- Font sizes
- Border radius

### Responsive Considerations

Design with mobile in mind:
- Stack elements vertically
- Increase tap targets
- Simplify layouts
- Test at 320px width

## Original Workflow Documentation

### Designer Setup

#### 1. Figma File Organization
```
Email Templates/
├── Transactional/
│   ├── Welcome Email
│   ├── Password Reset
│   └── Order Confirmation
└── Marketing/
    ├── Newsletter
    └── Promotional
```

#### 2. Design Constraints
- **Canvas Width**: 600px (fixed)
- **Background**: Extend to 100% viewport
- **Images**: Export at 2x for retina
- **Fonts**: Use web-safe fonts only
  - Primary: Arial, Helvetica
  - Serif: Georgia, Times New Roman

#### 3. Component Setup
- Create reusable components:
  - Header with logo
  - Footer with links
  - CTA buttons
  - Content blocks
- Name layers semantically
- Use Figma variables for colors

#### 4. Preparing for Handoff
1. Enable Dev Mode in Figma
2. Select email frame
3. Copy node ID from URL or Dev Mode panel
4. Share with developer

### Developer Workflow

#### 1. Getting Started
```bash
# In Claude Code with Figma MCP configured
# Use the node ID provided by designer
```

#### 2. Generate Template
1. Request: "Generate email template from Figma node 123:456"
2. Claude will:
   - Fetch the design
   - Convert to email-compatible HTML
   - Apply inline CSS
   - Create table-based layout

#### 3. Post-Generation Tasks
- Replace localhost image URLs with CDN
- Add tracking parameters to links
- Test personalization tokens
- Validate HTML

#### 4. Asset Management
```
/assets
  /images
    - hero-banner@2x.jpg
    - logo.png
    - icon-facebook.png
```

### MCP Server Configuration

#### For Designers
1. Get Figma access token:
   - Go to Figma → Settings → Personal access tokens
   - Generate new token
   - Copy and save securely

2. Share with developer for setup

#### For Developers
1. Install Figma MCP server
2. Configure in `.claude/mcp_settings.json`
3. Test connection with sample node

### Best Practices

#### Design Phase
- Keep designs simple and modular
- Avoid complex layouts
- Use standard email patterns
- Test color contrast

#### Development Phase
- Always validate generated HTML
- Test across email clients
- Optimize images before deployment
- Keep file size under 100KB

#### Collaboration
- Use consistent naming conventions
- Document any special requirements
- Include mobile and desktop views
- Provide feedback loops

### Troubleshooting

#### Common Issues
1. **Images not loading**: Check URLs and permissions
2. **Layout breaking**: Verify table structure
3. **Fonts not displaying**: Use web-safe fallbacks
4. **Colors different**: Use hex codes, not rgba

#### Getting Help
- Check email client documentation
- Use testing tools (Litmus, Email on Acid)
- Refer to email development resources

## Design Handoff Checklist

- [ ] Frame is exactly 600px wide
- [ ] All text is 14px+ on mobile
- [ ] Images are optimized
- [ ] Colors meet contrast requirements
- [ ] Links are clearly styled
- [ ] Unsubscribe link included
- [ ] Design works at 320px
- [ ] Assets are properly named
- [ ] Dev Mode is enabled
- [ ] Frame is selected for MCP