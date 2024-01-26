import imageio
import pandas as pd
from skimage.metrics import structural_similarity as ssim
import matplotlib.pyplot as plt

def compare_images_imageio(image1_path, image2_path):
    # Read images
    img1 = imageio.imread(image1_path)
    img2 = imageio.imread(image2_path)

    # Convert images to grayscale if they are in color
    if img1.ndim == 3:
        img1 = img1.mean(axis=-1)
    if img2.ndim == 3:
        img2 = img2.mean(axis=-1)

    # Compute the structural similarity index
    similarity_index, _ = ssim(img1, img2, full=True)

    # Create a differential image
    diff_image = img1 - img2

    return similarity_index, diff_image

def generate_report(image1_path, image2_path, output_path):
    similarity_index, diff_image = compare_images_imageio(image1_path, image2_path)

    # Save the differential image
    output_image_path = output_path.replace(".csv", "_diff.png")
    plt.imshow(diff_image, cmap='seismic', vmin=-255, vmax=255)
    plt.title(f'Difference (SSIM: {similarity_index:.4f})')
    plt.colorbar()
    plt.savefig(output_image_path)
    plt.close()

    # Create a Pandas DataFrame for the report
    data = {
        "Image 1": [image1_path],
        "Image 2": [image2_path],
        "SSIM": [similarity_index],
        "Differential Image": [output_image_path]
    }

    df = pd.DataFrame(data)

    # Save the report as a CSV file
    df.to_csv(output_path, index=False)

if __name__ == "__main__":
    image1_path = "C:/dev/Python/Data/IMAGE_1.png"  # Replace with the path to your first image
    image2_path = "C:/dev/Python/Data/IMAGE_2.png"  # Replace with the path to your second image
    output_report_path = "C:/dev/Python/Data/comparison_report.csv"  # Replace with the desired output report path


    generate_report(image1_path, image2_path, output_report_path)
