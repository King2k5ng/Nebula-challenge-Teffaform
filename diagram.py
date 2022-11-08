from diagrams import Diagram
from diagrams.aws.storage import S3
from diagrams.aws.network import CloudFront
from diagrams.aws.general import Client

with Diagram("Nebula Project", show=True):
    Client("Browser") >> CloudFront("Distribution") >> S3("Static Website Hosting")