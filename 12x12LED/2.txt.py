import cv2
import os

input_dir = "frames"
output_dir = "led_txt"
os.makedirs(output_dir, exist_ok=True)

frame_files = sorted([f for f in os.listdir(input_dir) if f.endswith('.png')])

for idx, fname in enumerate(frame_files, 1):
    path = os.path.join(input_dir, fname)
    img = cv2.imread(path, cv2.IMREAD_GRAYSCALE)  

    led_mat = (img.astype('float') / 255 * 120).astype(int)

    txt_path = os.path.join(output_dir, f"frame_{idx:04d}.txt")
    with open(txt_path, 'w') as f:
        for row in led_mat:
            line = ' '.join(str(v) for v in row)
            f.write(line + '\n')

print("End", output_dir)
