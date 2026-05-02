.class public interface abstract Lcom/mikepenz/fastadapter/FastAdapter$OnClickListener;
.super Ljava/lang/Object;
.source "FastAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/fastadapter/FastAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnClickListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item::",
        "Lcom/mikepenz/fastadapter/IItem;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onClick(Landroid/view/View;Lcom/mikepenz/fastadapter/IAdapter;Lcom/mikepenz/fastadapter/IItem;I)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/mikepenz/fastadapter/IAdapter",
            "<TItem;>;TItem;I)Z"
        }
    .end annotation
.end method
