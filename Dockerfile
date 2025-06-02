# Use Python 3.12.10 as the base image
FROM python:3.12.10-slim

# Set working directory
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY task1/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY task1/matches.py .
COPY task1/data.json .
COPY task1/templates/ templates/

# Expose port 80
EXPOSE 80

# Command to run the application
CMD ["python", "matches.py"] 