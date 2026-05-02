.class Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;
.super Ljava/lang/Object;
.source "InternalLayoutInflater.java"

# interfaces
.implements Landroid/view/LayoutInflater$Factory2;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/iconics/context/InternalLayoutInflater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WrapperFactory2"
.end annotation


# instance fields
.field protected final mFactory2:Landroid/view/LayoutInflater$Factory2;

.field protected final mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;


# direct methods
.method public constructor <init>(Landroid/view/LayoutInflater$Factory2;Lcom/mikepenz/iconics/context/IconicsFactory;)V
    .registers 3
    .param p1, "factory2"    # Landroid/view/LayoutInflater$Factory2;
    .param p2, "iconicsFactory"    # Lcom/mikepenz/iconics/context/IconicsFactory;

    .prologue
    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 228
    iput-object p1, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;->mFactory2:Landroid/view/LayoutInflater$Factory2;

    .line 229
    iput-object p2, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    .line 230
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 7
    .param p1, "parent"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 241
    iget-object v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    iget-object v1, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;->mFactory2:Landroid/view/LayoutInflater$Factory2;

    .line 242
    invoke-interface {v1, p1, p2, p3, p4}, Landroid/view/LayoutInflater$Factory2;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v1

    .line 241
    invoke-virtual {v0, v1, p3, p4}, Lcom/mikepenz/iconics/context/IconicsFactory;->onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 234
    iget-object v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    iget-object v1, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2;->mFactory2:Landroid/view/LayoutInflater$Factory2;

    .line 235
    invoke-interface {v1, p1, p2, p3}, Landroid/view/LayoutInflater$Factory2;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v1

    .line 234
    invoke-virtual {v0, v1, p2, p3}, Lcom/mikepenz/iconics/context/IconicsFactory;->onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
