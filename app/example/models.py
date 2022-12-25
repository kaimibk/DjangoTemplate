from django.db import models
from django_prometheus.models import ExportModelOperationsMixin


class Paper(ExportModelOperationsMixin("paper"), models.Model):
    """This is a demo Paper model"""

    # TODO: create relation
    authors = models.CharField(max_length=120)
    year = models.IntegerField()
    title = models.CharField(max_length=300)
    date_added = models.DateField()
    url = models.URLField()
    pdf_file = models.FileField()

    def __str__(self):
        return f"{self.title} {self.authors} {str(self.year)}"
