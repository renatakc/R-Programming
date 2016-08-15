
library(scatterplot3d)
# create column indicating point color
mtcars$pcolor[mtcars$cyl==4] <- "red"
mtcars$pcolor[mtcars$cyl==6] <- "blue"
mtcars$pcolor[mtcars$cyl==8] <- "darkgreen"
with(mtcars, {
  s3d <- scatterplot3d(disp, wt, mpg,        # x y and z axis
                       color=pcolor, pch=19,        # circle color indicates no. of cylinders
                       type="h", lty.hplot=2,       # lines to the horizontal plane
                       scale.y=.75,                 # scale y axis (reduce by 25%)
                       main="3-D Scatterplot Example 4",
                       xlab="Displacement (cu. in.)",
                       ylab="Weight (lb/1000)",
                       zlab="Miles/(US) Gallon")
  s3d.coords <- s3d$xyz.convert(disp, wt, mpg)
  text(s3d.coords$x, s3d.coords$y,     # x and y coordinates
       labels=row.names(mtcars),       # text to plot
       pos=4, cex=.5)                  # shrink text 50% and place to right of points)
  # add the legend
  legend("topleft", inset=.05,      # location and inset
         bty="n", cex=.5,              # suppress legend box, shrink text 50%
         title="Number of Cylinders",
         c("4", "6", "8"), fill=c("red", "blue", "darkgreen"))
})