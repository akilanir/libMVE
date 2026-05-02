.class public interface abstract Lcom/einmalfel/earl/Item;
.super Ljava/lang/Object;
.source "Item.java"


# virtual methods
.method public abstract getAuthor()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getDescription()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getEnclosures()Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/einmalfel/earl/Enclosure;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getId()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getImageLink()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getLink()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getPublicationDate()Ljava/util/Date;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getTitle()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method
