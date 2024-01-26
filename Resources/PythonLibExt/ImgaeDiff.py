from PIL import Image
import imagehash

def compare_images_imagehash(image1_path, image2_path):
    # Load images
    img1 = Image.open(image1_path)
    img2 = Image.open(image2_path)

    # Compute image hashes
    hash1 = imagehash.average_hash(img1)
    hash2 = imagehash.average_hash(img2)

    # Compute hamming distance between hashes
    hamming_distance = hash1 - hash2

    return hamming_distance

def generate_imagehash_compare_report(image1_path, image2_path, output_path):
    hamming_distance = compare_images_imagehash(image1_path, image2_path)

    # Create a report
    report = f"Comparison Report:\n\n"
    report += f"File 1: {image1_path}\n"
    report += f"File 2: {image2_path}\n"
    report += f"Hamming Distance: {hamming_distance}\n"

    if hamming_distance == 0:
        report += "Images are identical."
    else:
        report += "Images are different."

    # Save the report to a file
    with open(output_path, 'w') as report_file:
        report_file.write(report)

    return report

# if __name__ == "__main__":
#     image1_path = "C:/dev/Python/Data/IMAGE_1.png"  # Replace with the path to your first image
#     image2_path = "C:/dev/Python/Data/CapturedImage.png"  # Replace with the path to your second image
#     output_report_path = "C:/dev/Python/Data/comparison_report.txt"  # Replace with the desired output report path

#     report = generate_imagehash_compare_report(image1_path, image2_path, output_report_path)
#     print(report)
