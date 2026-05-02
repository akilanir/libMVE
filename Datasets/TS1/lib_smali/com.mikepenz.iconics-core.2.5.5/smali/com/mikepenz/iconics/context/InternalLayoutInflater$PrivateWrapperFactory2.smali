.class Lcom/mikepenz/iconics/context/InternalLayoutInflater$PrivateWrapperFactory2;
.super Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;
.source "InternalLayoutInflater.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/iconics/context/InternalLayoutInflater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PrivateWrapperFactory2"
.end annotation


# instance fields
.field private final mInflater:Lcom/mikepenz/iconics/context/InternalLayoutInflater;


# direct methods
.method public constructor <init>(Landroid/view/LayoutInflater$Factory2;Lcom/mikepenz/iconics/context/InternalLayoutInflater;Lcom/mikepenz/iconics/context/IconicsFactory;)V
    .registers 4
    .param p1, "factory2"    # Landroid/view/LayoutInflater$Factory2;
    .param p2, "inflater"    # Lcom/mikepenz/iconics/context/InternalLayoutInflater;
    .param p3, "iconicsFactory"    # Lcom/mikepenz/iconics/context/IconicsFactory;

    .prologue
    .line 257
    invoke-direct {p0, p1, p3}, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;-><init>(Landroid/view/LayoutInflater$Factory2;Lcom/mikepenz/iconics/context/IconicsFactory;)V

    .line 258
    iput-object p2, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$PrivateWrapperFactory2;->mInflater:Lcom/mikepenz/iconics/context/InternalLayoutInflater;

    .line 259
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 12
    .param p1, "parent"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 263
    iget-object v6, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$PrivateWrapperFactory2;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    iget-object v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$PrivateWrapperFactory2;->mInflater:Lcom/mikepenz/iconics/context/InternalLayoutInflater;

    iget-object v1, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$PrivateWrapperFactory2;->mFactory2:Landroid/view/LayoutInflater$Factory2;

    .line 266
    invoke-interface {v1, p1, p2, p3, p4}, Landroid/view/LayoutInflater$Factory2;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v2

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 264
    # invokes: Lcom/mikepenz/iconics/context/InternalLayoutInflater;->createCustomViewInternal(Landroid/view/View;Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    invoke-static/range {v0 .. v5}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->access$000(Lcom/mikepenz/iconics/context/InternalLayoutInflater;Landroid/view/View;Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    .line 263
    invoke-virtual {v6, v0, p3, p4}, Lcom/mikepenz/iconics/context/IconicsFactory;->onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
