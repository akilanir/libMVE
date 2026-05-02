.class public interface abstract Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
.super Ljava/lang/Object;
.source "IProfile.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract getEmail()Ljava/lang/String;
.end method

.method public abstract getIcon()Landroid/graphics/drawable/Drawable;
.end method

.method public abstract getIconBitmap()Landroid/graphics/Bitmap;
.end method

.method public abstract getIconUri()Landroid/net/Uri;
.end method

.method public abstract getIdentifier()I
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract isSelectable()Z
.end method

.method public abstract setEmail(Ljava/lang/String;)V
.end method

.method public abstract setIcon(Landroid/graphics/drawable/Drawable;)V
.end method

.method public abstract setIcon(Landroid/net/Uri;)V
.end method

.method public abstract setIcon(Ljava/lang/String;)V
.end method

.method public abstract setIconBitmap(Landroid/graphics/Bitmap;)V
.end method

.method public abstract setName(Ljava/lang/String;)V
.end method

.method public abstract setSelectable(Z)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation
.end method

.method public abstract withEmail(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract withIcon(Landroid/graphics/Bitmap;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/drawable/Drawable;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract withIcon(Landroid/net/Uri;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract withIcon(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract withName(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract withSelectable(Z)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation
.end method
