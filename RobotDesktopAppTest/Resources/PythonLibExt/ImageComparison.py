from PIL import Image
import os

def compare_images(file1, file2):
    try:
        # Open the images using Pillow
        img1 = Image.open(file1)
        img2 = Image.open(file2)

        # Get image properties
        size1 = os.path.getsize(file1)
        size2 = os.path.getsize(file2)

        width1, height1 = img1.size
        width2, height2 = img2.size

        # Compare sizes
        size_difference = abs(size1 - size2)

        # Compare dimensions
        dimension_difference = (width1 != width2) or (height1 != height2)

        # Compare pixel data
        pixel_difference = not img1.tobytes() == img2.tobytes()

        # Generate comparison report
        report = f"Comparison Report:\n\n"
        report += f"File 1: {file1}\n"
        report += f"Size: {size1} bytes, Dimensions: {width1}x{height1}\n"

        report += f"\nFile 2: {file2}\n"
        report += f"Size: {size2} bytes, Dimensions: {width2}x{height2}\n"

        report += "\nDifferences:\n"
        report += f"Size Difference: {size_difference} bytes\n"
        report += f"Dimension Difference: {dimension_difference}\n"
        report += f"Pixel Difference: {pixel_difference}\n"

        if size_difference == 0 and not dimension_difference and not pixel_difference:
            report += "\nImages are identical."
        else:
            report += "\nImages are different."
            if not(not dimension_difference and not pixel_difference):
                report += "\nImages pixels are different"
            

        return report

    except Exception as e:
        return f"Error: {e}"
