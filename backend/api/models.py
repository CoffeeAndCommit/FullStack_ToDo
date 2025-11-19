from django.db import models

# Create your models here.

class Todo(models.Model):
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=500)
    completed = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
    
    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Todo'
        verbose_name_plural = 'Todos'
        db_table = 'todos'  
