#!/bin/bash

# Script to update all nanc packages to compatible versions

echo "Updating all nanc packages dependencies..."

# List of packages to update (excluding root pubspec.yaml)
packages=(
    "nanc_api_firebase"
    "nanc_api_local" 
    "nanc_api_supabase"
    "nanc_fonts"
    "nanc_icons"
    "nanc_lints"
)

# Function to update a package
update_package() {
    local package_name=$1
    local package_path="../nanc/$package_name"
    
    if [ -d "$package_path" ] && [ -f "$package_path/pubspec.yaml" ]; then
        echo "Updating $package_name..."
        cd "$package_path"
        
        # Update copy_with_extension to 6.0.1 if present
        if grep -q "copy_with_extension:" pubspec.yaml; then
            sed -i '' 's/copy_with_extension: \^[0-9]\+\.[0-9]\+\.[0-9]\+/copy_with_extension: ^6.0.1/g' pubspec.yaml
        fi
        
        # Update copy_with_extension_gen to 6.0.1 if present
        if grep -q "copy_with_extension_gen:" pubspec.yaml; then
            sed -i '' 's/copy_with_extension_gen: \^[0-9]\+\.[0-9]\+\.[0-9]\+/copy_with_extension_gen: ^6.0.1/g' pubspec.yaml
        fi
        
        # Update other common dependencies
        sed -i '' 's/json_annotation: \^4\.[0-9]\+\.[0-9]\+/json_annotation: ^4.9.0/g' pubspec.yaml
        sed -i '' 's/json_serializable: \^6\.[0-9]\+\.[0-9]\+/json_serializable: ^6.9.5/g' pubspec.yaml
        sed -i '' 's/build_runner: \^2\.[0-9]\+\.[0-9]\+/build_runner: ^2.4.15/g' pubspec.yaml
        sed -i '' 's/equatable: \^2\.[0-9]\+\.[0-9]\+/equatable: ^2.0.7/g' pubspec.yaml
        
        # Update analyzer override if present
        if grep -q "analyzer:" pubspec.yaml; then
            sed -i '' 's/analyzer: \^[0-9]\+\.[0-9]\+\.[0-9]\+/analyzer: ^7.0.0/g' pubspec.yaml
        else
            # Add dependency_overrides if not present
            if ! grep -q "dependency_overrides:" pubspec.yaml; then
                echo "" >> pubspec.yaml
                echo "dependency_overrides:" >> pubspec.yaml
                echo "  analyzer: ^7.0.0" >> pubspec.yaml
            fi
        fi
        
        cd - > /dev/null
        echo "Updated $package_name"
    else
        echo "Package $package_name not found or no pubspec.yaml"
    fi
}

# Update each package
for package in "${packages[@]}"; do
    update_package "$package"
done

echo "All packages updated!"
