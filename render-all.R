source('render.R', echo=FALSE)

# # top level
# render(template = "", topic = "")
# 
# # second deep levels
# render(template = "topics/", "topics/")
render(template = "visualizations/", "visualizations/")
# render(template = "swipe-file/", topic = "swipe-file/")
# 
# # third deep levels
# 
# #topics
# 
# render(template = "topics/topic/", topic = "topics/data-visualization/")
# 
# #visualizations
# 
# render(template = "visualizations/visualization/", topic = "visualizations/WICHE/")
# render(template = "visualizations/visualization/", topic = "visualizations/AP-Admin/")
# render(template = "visualizations/visualization/", topic = "visualizations/AS-Viz/")
# render(template = "visualizations/visualization/", topic = "visualizations/Demographics/")
render(template = "visualizations/visualization/", topic = "visualizations/matched-cohort/")
