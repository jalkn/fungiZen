from rest_framework import serializers
from django.contrib.auth.models import User
from .models import BiohackerProfile

class RegistrationSerializer(serializers.ModelSerializer):
    # Fields for the BiohackerProfile
    weight_kg = serializers.DecimalField(max_digits=5, decimal_places=2, required=False)
    height_cm = serializers.IntegerField(required=False)
    birth_year = serializers.IntegerField(required=False)
    primary_goal = serializers.ChoiceField(choices=BiohackerProfile.PRIMARY_GOAL_CHOICES)
    occupation = serializers.CharField(max_length=100, required=False, allow_blank=True)

    class Meta:
        model = User
        fields = [
            'username', 'email', 'password', 
            'weight_kg', 'height_cm', 'birth_year', 
            'primary_goal', 'occupation'
        ]
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        # 1. Extract profile-specific data
        profile_data = {
            'weight_kg': validated_data.pop('weight_kg', None),
            'height_cm': validated_data.pop('height_cm', None),
            'birth_year': validated_data.pop('birth_year', None),
            'primary_goal': validated_data.pop('primary_goal', 'FOCUS'),
            'occupation': validated_data.pop('occupation', ''),
        }

        # 2. Create the base User
        user = User.objects.create_user(**validated_data)

        # 3. Create the BiohackerProfile linked to the new User
        BiohackerProfile.objects.create(user=user, **profile_data)

        return user