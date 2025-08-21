Docker Application Monitoring with Prometheus

A comprehensive project demonstrating how to monitor a Dockerized Flask application using Prometheus metrics collection and visualization.

<img alt="image" src="https://github.com/user-attachments/assets/28c96f01-7cf5-4126-a0a7-8f5d06f2e29b" />

<img alt="architecture-2" src="https://github.com/user-attachments/assets/d3e629a4-2007-4219-b0a0-2742afc6b645" />



Project Overview

This project showcases the implementation of application monitoring using Prometheus for a containerized Python Flask web application. The setup includes:

- Flask Application: A simple web server with custom Prometheus metrics
- Docker Container: Containerized deployment for consistent environments
- Prometheus Integration: Real-time metrics collection and monitoring
- Load Testing: Automated traffic generation for testing monitoring capabilities

Architecture

The project consists of three main components:

1. Flask Web Application (`app.py`): Serves HTTP requests and exposes Prometheus metrics
2. Docker Container (`Dockerfile`): Containerizes the application for deployment
3. Load Generator (`script-1.sh`): Generates traffic to test monitoring functionality

Monitoring Dashboard

Application Request Metrics
![Request Metrics]

<img alt="image-1" src="https://github.com/user-attachments/assets/305d835a-f4f2-45db-89cf-1a924ba0466d" />

The dashboard shows the `app_total_requests_total` metric tracking the number of requests over time. The graph demonstrates how the application handled 50+ requests during the testing period.

Container Memory Usage
![Memory Usage]

<img alt="image-4" src="https://github.com/user-attachments/assets/0e1e8809-8caf-423a-905d-8444458203eb" />

Container memory usage metrics provide insights into resource consumption across different system components and services running in the monitored environment.

Prometheus Targets Status
![Targets Status]

<img alt="image-3" src="https://github.com/user-attachments/assets/86820134-e6e3-417d-ba81-3af125b95cad" />

The targets page shows the monitoring status of various endpoints including:
- Python-App: The main Flask application (currently down in screenshot)
- cAdvisor-node: Container monitoring agent (up and running)
- prometheus: Self-monitoring (up and running)

System Overview Dashboard
![System Overview]

<img alt="image-2" src="https://github.com/user-attachments/assets/fbd67e52-2e3e-482e-9dbb-c195559e4f6a" />

Comprehensive system monitoring dashboard displaying:
- CPU Usage: Real-time CPU utilization across multiple cores
- Memory Usage: System memory consumption patterns
- Process Information: Running processes and resource allocation

Metrics Endpoint Output
![Metrics Output]

<img width="782" height="642" alt="image-5" src="https://github.com/user-attachments/assets/34ea9a32-a1f5-4081-9490-ec8d9151d757" />

Raw metrics output from the `/metrics` endpoint showing detailed Prometheus metrics including:
- Python garbage collection statistics
- Process memory and CPU metrics
- Custom application metrics (`app_total_requests_total`)

Quick Start

Prerequisites

- Docker installed on your system
- Prometheus server running
- Basic knowledge of containerization and monitoring

1. Build the Docker Image

```bash
docker build -t flask-prometheus-app .
```

2. Run the Container

```bash
docker run -d -p 5000:5000 --name flask-app flask-prometheus-app
```

3. Verify the Application

```bash
# Check if the app is running
curl http://localhost:5000

# Check metrics endpoint
curl http://localhost:5000/metrics
```

4. Generate Load for Testing

```bash
chmod +x script-1.sh
./script-1.sh
```

File Structure

```
monitoring-docker-prometheus/
├── app.py              # Flask application with Prometheus metrics
├── Dockerfile          # Container configuration
├── script-1.sh         # Load testing script
└── README.md          # Project documentation
```

Configuration Details

Flask Application Features

- Health Check Endpoint: `/` returns a simple greeting
- Metrics Endpoint: `/metrics` exposes Prometheus-compatible metrics
- Request Counter: Tracks total number of requests to the application
- Auto-increment: Each request automatically increments the counter

Docker Configuration

- Base Image: Python 3.8 slim for minimal footprint
- Dependencies: Flask, prometheus_client, prometheus-flask-exporter
- Port: Exposes port 5000 for HTTP traffic
- Working Directory: `/app` for organized file structure

Prometheus Metrics

The application exposes several metrics:
- `app_total_requests_total`: Custom counter for application requests
- Python runtime metrics (garbage collection, memory usage)
- Process metrics (CPU, memory, file descriptors)

Monitoring Capabilities

Available Metrics

1. Application Metrics
   - Total requests received
   - Request rate and patterns

2. System Metrics
   - CPU usage and load
   - Memory consumption
   - Container resource utilization

3. Runtime Metrics
   - Python garbage collection
   - Process statistics
   - Thread and file descriptor counts

Dashboard Features

- Real-time metric visualization
- Historical data analysis
- Alert configuration capabilities
- Multi-target monitoring support

Usage Examples

Monitoring Application Health

```bash
# Check application status
curl -I http://localhost:5000

# View current metrics
curl http://localhost:5000/metrics | grep app_total_requests
```

Load Testing

The included script generates controlled traffic:
- 50 sequential requests
- 1-second intervals between requests
- Silent execution with progress tracking

Troubleshooting

0. If the process is running and make you cannot run any commands,
you can try to grep the process and kill it or wait untill it finished
ps -ef | grep "<process-name>"

1. Container Won't Start
   - Verify Docker is running
   - Check port 5000 availability
   - Review container logs: `docker logs flask-app`

2. Metrics Not Appearing
   - Ensure Prometheus is configured to scrape `localhost:5000/metrics`
   - Verify application is responding on the metrics endpoint
   - Check Prometheus targets page for scraping status

3. Load Script Fails
   - Make script executable: `chmod +x script-1.sh`
   - Verify application is running before executing script
   - Check curl is installed on the system


License

This project is open source and available under the MIT License.
