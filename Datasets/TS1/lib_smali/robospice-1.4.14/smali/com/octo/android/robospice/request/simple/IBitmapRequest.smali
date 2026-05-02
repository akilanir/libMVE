.class public interface abstract Lcom/octo/android/robospice/request/simple/IBitmapRequest;
.super Ljava/lang/Object;
.source "IBitmapRequest.java"


# virtual methods
.method public abstract getCacheFile()Ljava/io/File;
.end method

.method public abstract loadDataFromNetwork()Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
