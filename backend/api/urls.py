from django.urls import include, path

from .views import TodoGetCreate, TodoUpdateDelete


urlpatterns = [
    path('', TodoGetCreate.as_view(), name='todo-list-create'),
     path('<int:pk>/', TodoUpdateDelete.as_view(), name='todo-update-delete'),
   
]
