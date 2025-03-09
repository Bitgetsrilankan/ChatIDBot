# Use an official Python image (Alpine version is lightweight)
FROM python:3.12-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy only requirements.txt first (for better caching)
COPY requirements.txt .

# Install system dependencies required for building packages
RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev

# Install dependencies globally inside the container
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files into the container
COPY . .

# Run the bot
CMD ["python", "main.py"]