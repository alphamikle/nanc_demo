#!/bin/bash

# Script to update all nanc packages to compatible versions

echo "Updating nanc packages dependencies..."

# List of packages to update
packages=(
    "nanc_configuration"
    "nanc"
    "nui_svg_renderer"
    "nanc_api_firebase"
    "nanc_api_supabase"
)

# Update each package
for package in "${packages[@]}"; do
    if [ -d "../nanc/$package" ]; then
        echo "Updating $package..."
        cd "../nanc/$package"
        
        # Update copy_with_extension to 6.0.1
        sed -i '' 's/copy_with_extension: \^[0-9]\+\.[0-9]\+\.[0-9]\+/copy_with_extension: ^6.0.1/g' pubspec.yaml
        sed -i '' 's/copy_with_extension_gen: \^[0-9]\+\.[0-9]\+\.[0-9]\+/copy_with_extension_gen: ^6.0.1/g' pubspec.yaml
        
        # Add dependency overrides if not present
        if ! grep -q "dependency_overrides:" pubspec.yaml; then
            echo "" >> pubspec.yaml
            echo "dependency_overrides:" >> pubspec.yaml
            echo "  analyzer: ^6.0.0" >> pubspec.yaml
        fi
        
        cd - > /dev/null
    fi
done

echo "Dependencies updated!"
