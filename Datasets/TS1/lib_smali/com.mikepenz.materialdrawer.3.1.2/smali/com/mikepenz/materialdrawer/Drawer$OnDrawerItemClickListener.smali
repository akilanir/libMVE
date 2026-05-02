.class public interface abstract Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;
.super Ljava/lang/Object;
.source "Drawer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/Drawer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnDrawerItemClickListener"
.end annotation


# virtual methods
.method public abstract onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ")Z"
        }
    .end annotation
.end method
