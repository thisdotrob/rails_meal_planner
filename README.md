# meal_planner

## Deployment

```
git push heroku master
heroku run rails db:migrate
```

## Reset production DB

```
heroku pg:reset DATABASE
heroku run rails db:migrate
```
