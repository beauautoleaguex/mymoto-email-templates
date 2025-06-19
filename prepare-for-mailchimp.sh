#!/bin/bash

# Script to prepare email templates for Mailchimp import
# Usage: ./prepare-for-mailchimp.sh template-name

# Check if template name is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide a template name"
    echo "Usage: ./prepare-for-mailchimp.sh template-name"
    echo "Example: ./prepare-for-mailchimp.sh rewards-launch"
    exit 1
fi

TEMPLATE_NAME=$1
TEMPLATE_DIR="templates/marketing"
TEMPLATE_FILE="${TEMPLATE_DIR}/${TEMPLATE_NAME}.html"
ASSETS_DIR="assets/images"
EXPORT_DIR="mailchimp-exports"
TEMP_DIR="${EXPORT_DIR}/temp-${TEMPLATE_NAME}"
OUTPUT_ZIP="${EXPORT_DIR}/${TEMPLATE_NAME}-mailchimp.zip"

# Check if template exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file not found: $TEMPLATE_FILE"
    exit 1
fi

echo "Preparing ${TEMPLATE_NAME} for Mailchimp import..."

# Create export directory if it doesn't exist
mkdir -p "$EXPORT_DIR"

# Clean up any existing temp directory
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

echo "Processing template and copying assets..."

# Copy template and update Mailchimp merge tags
cp "$TEMPLATE_FILE" "$TEMP_DIR/${TEMPLATE_NAME}.html"

# Update the template with Mailchimp merge tags
# Handle unsubscribe link
sed -i '' 's|<a href="#"|<a href="*|UNSUB|*"|g' "$TEMP_DIR/${TEMPLATE_NAME}.html"
# Update copyright
sed -i '' 's|Copyright © [0-9]* MyMoto Pty Ltd|Copyright © *|CURRENT_YEAR|* *|LIST:COMPANY|*|g' "$TEMP_DIR/${TEMPLATE_NAME}.html"
# Remove image paths
sed -i '' 's|../../assets/images/||g' "$TEMP_DIR/${TEMPLATE_NAME}.html"

# Extract all image filenames from the template
IMAGE_FILES=$(grep -o 'src="[^"]*\.png"' "$TEMP_DIR/${TEMPLATE_NAME}.html" | sed 's/src="//g' | sed 's/"//g' | sort -u)

# Copy all referenced images
echo "Copying images..."
for img in $IMAGE_FILES; do
    if [ -f "${ASSETS_DIR}/${img}" ]; then
        cp "${ASSETS_DIR}/${img}" "$TEMP_DIR/"
        echo "  ✓ Copied: $img"
    else
        echo "  ⚠ Warning: Image not found: ${ASSETS_DIR}/${img}"
    fi
done

# Also copy SVG versions if they exist (Mailchimp may use them)
SVG_FILES=$(echo "$IMAGE_FILES" | sed 's/\.png/.svg/g')
for svg in $SVG_FILES; do
    if [ -f "${ASSETS_DIR}/${svg}" ]; then
        cp "${ASSETS_DIR}/${svg}" "$TEMP_DIR/"
        echo "  ✓ Copied: $svg"
    fi
done

# Create ZIP file
echo "Creating ZIP file..."
cd "$TEMP_DIR"
zip -r "../../${OUTPUT_ZIP}" ./* > /dev/null
cd ../..

# Check ZIP size
ZIP_SIZE=$(du -k "$OUTPUT_ZIP" | cut -f1)
if [ $ZIP_SIZE -gt 1024 ]; then
    echo "⚠ Warning: ZIP file is larger than 1MB (${ZIP_SIZE}KB)"
    echo "Mailchimp requires ZIP files to be under 1MB"
else
    echo "✓ ZIP file size: ${ZIP_SIZE}KB (under 1MB limit)"
fi

# Clean up temp directory
rm -rf "$TEMP_DIR"

echo ""
echo "✅ Success! Template prepared for Mailchimp import"
echo "📦 Output file: $OUTPUT_ZIP"
echo ""
echo "To import into Mailchimp:"
echo "1. Go to Templates in your Mailchimp account"
echo "2. Click 'Create Template'"
echo "3. Select 'Code your own'"
echo "4. Choose 'Import ZIP'"
echo "5. Upload: $OUTPUT_ZIP"
echo ""
echo "The following merge tags were added:"
echo "  - *|UNSUB|* for unsubscribe link"
echo "  - *|CURRENT_YEAR|* for copyright year"
echo "  - *|LIST:COMPANY|* for company name"