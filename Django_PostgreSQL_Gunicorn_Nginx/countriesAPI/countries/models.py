from django.db import models

class Countries(models.Model):
	name=models.CharField(max_length=200, blank=False, default='')
	capital=models.CharField(max_length=200, blank=False, default='')
	
	class Meta:
		ordering=('id',)
		
	def __str__(self):
		return self.name
