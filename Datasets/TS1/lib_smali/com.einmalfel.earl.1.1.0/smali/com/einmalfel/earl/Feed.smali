.class public interface abstract Lcom/einmalfel/earl/Feed;
.super Ljava/lang/Object;
.source "Feed.java"


# virtual methods
.method public abstract getAuthor()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getCopyright()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getDescription()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getImageLink()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getItems()Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/einmalfel/earl/Item;",
            ">;"
        }
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
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method
