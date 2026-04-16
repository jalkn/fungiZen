from django.db import models
from django.contrib.auth.models import User

class BiohackerProfile(models.Model):
    # Link to Django's default User (Email, Password, Name)
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
    
    # Physical Metrics for Dosage Calculation
    weight_kg = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)
    height_cm = models.PositiveSmallIntegerField(null=True, blank=True)
    birth_year = models.PositiveIntegerField(null=True, blank=True)
    
    # Bio-Optimization Goals
    # This helps the app suggest recipes or specific BioRush lines
    PRIMARY_GOAL_CHOICES = [
        ('FOCUS', 'Cognitive Performance & Focus'),
        ('STAMINA', 'Physical Endurance & Energy'),
        ('RECOVERY', 'Stress Management & Sleep'),
        ('IMMUNITY', 'Immune System Support'),
    ]
    primary_goal = models.CharField(
        max_length=20, 
        choices=PRIMARY_GOAL_CHOICES, 
        default='FOCUS'
    )
    
    # Professional Context
    # Since Zenergy targets high-performance individuals
    occupation = models.CharField(max_length=100, blank=True)
    
    # Metadata
    created_at = models.DateTimeField(auto_now_add=True)
    is_zbox_owner = models.BooleanField(default=False)

    def __str__(self):
        return f"Biohacker: {self.user.username}"