.class public interface abstract Lcom/yalantis/ucrop/callback/BitmapCropCallback;
.super Ljava/lang/Object;
.source "BitmapCropCallback.java"


# virtual methods
.method public abstract onBitmapCropped()V
.end method

.method public abstract onCropFailure(Ljava/lang/Exception;)V
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
