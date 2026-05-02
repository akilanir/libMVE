.class public interface abstract Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;
.super Ljava/lang/Object;
.source "Iconable.java"


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
.method public abstract getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;
.end method

.method public abstract getIcon()Landroid/graphics/drawable/Drawable;
.end method

.method public abstract setIIcon(Lcom/mikepenz/iconics/typeface/IIcon;)V
.end method

.method public abstract setIcon(Landroid/graphics/drawable/Drawable;)V
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

.method public abstract withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/iconics/typeface/IIcon;",
            ")TT;"
        }
    .end annotation
.end method
