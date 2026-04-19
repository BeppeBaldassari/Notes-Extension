#!/usr/bin/env python3
import zipfile
import os
import sys

def create_xpi(project_root, output_path):
    """Create Firefox extension with proper structure (manifest.json first)"""
    
    print(f"Building Firefox extension: {project_root}")
    
    # Remove existing file
    if os.path.exists(output_path):
        os.remove(output_path)
    
    # Create zip - manifest.json must be first for Firefox compliance
    with zipfile.ZipFile(output_path, 'w', zipfile.ZIP_DEFLATED) as zf:
        # CRITICAL: manifest.json must be the first file in the archive
        manifest_path = os.path.join(project_root, 'manifest.json')
        if os.path.exists(manifest_path):
            zf.write(manifest_path, 'manifest.json')
            print(f"✓ manifest.json")
        else:
            print(f"✗ ERROR: manifest.json not found")
            sys.exit(1)
        
        # Add all other files in sorted order
        src_dir = os.path.join(project_root, 'src')
        if os.path.exists(src_dir):
            for root, dirs, files in os.walk(src_dir):
                for file in sorted(files):
                    if file.startswith('.'):
                        continue
                    file_path = os.path.join(root, file)
                    arcname = os.path.relpath(file_path, project_root)
                    zf.write(file_path, arcname)
                    print(f"✓ {arcname}")
        else:
            print(f"✗ ERROR: src directory not found")
            sys.exit(1)
    
    # Verify the archive
    print(f"\nVerifying archive:")
    with zipfile.ZipFile(output_path, 'r') as zf:
        files = zf.namelist()
        print(f"  First file: {files[0] if files else 'NONE'}")
        print(f"  Total files: {len(files)}")
        
        test_result = zf.testzip()
        if test_result:
            print(f"  ✗ ERROR: Corrupted file detected: {test_result}")
            sys.exit(1)
        else:
            print(f"  ✓ All files valid")
    
    size = os.path.getsize(output_path)
    print(f"\n✓ Successfully created {output_path}")
    print(f"  Size: {size} bytes")

if __name__ == '__main__':
    project_root = '/Users/beppe/Desktop/Notes-Extension'
    output_path = os.path.join(project_root, 'dist/notes.xpi')
    
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    create_xpi(project_root, output_path)
