.class public interface abstract Lcom/mikepenz/fastadapter/helpers/UndoHelper$UndoListener;
.super Ljava/lang/Object;
.source "UndoHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/fastadapter/helpers/UndoHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "UndoListener"
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
.method public abstract commitRemove(Ljava/util/Set;Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/fastadapter/FastAdapter$RelativeInfo",
            "<TItem;>;>;)V"
        }
    .end annotation
.end method
