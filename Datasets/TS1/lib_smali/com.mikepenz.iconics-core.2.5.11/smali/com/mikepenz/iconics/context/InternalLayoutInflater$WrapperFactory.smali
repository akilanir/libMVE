.class Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;
.super Ljava/lang/Object;
.source "InternalLayoutInflater.java"

# interfaces
.implements Landroid/view/LayoutInflater$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/iconics/context/InternalLayoutInflater;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WrapperFactory"
.end annotation


# instance fields
.field private final mFactory:Landroid/view/LayoutInflater$Factory;

.field private final mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

.field private final mInflater:Lcom/mikepenz/iconics/context/InternalLayoutInflater;


# direct methods
.method public constructor <init>(Landroid/view/LayoutInflater$Factory;Lcom/mikepenz/iconics/context/InternalLayoutInflater;Lcom/mikepenz/iconics/context/IconicsFactory;)V
    .registers 4
    .param p1, "factory"    # Landroid/view/LayoutInflater$Factory;
    .param p2, "inflater"    # Lcom/mikepenz/iconics/context/InternalLayoutInflater;
    .param p3, "iconicsFactory"    # Lcom/mikepenz/iconics/context/IconicsFactory;

    .prologue
    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    iput-object p1, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;->mFactory:Landroid/view/LayoutInflater$Factory;

    .line 198
    iput-object p2, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;->mInflater:Lcom/mikepenz/iconics/context/InternalLayoutInflater;

    .line 199
    iput-object p3, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    .line 200
    return-void
.end method


# virtual methods
.method public onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 204
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_1d

    .line 205
    iget-object v6, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    iget-object v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;->mInflater:Lcom/mikepenz/iconics/context/InternalLayoutInflater;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;->mFactory:Landroid/view/LayoutInflater$Factory;

    .line 207
    invoke-interface {v2, p1, p2, p3}, Landroid/view/LayoutInflater$Factory;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v2

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    .line 206
    # invokes: Lcom/mikepenz/iconics/context/InternalLayoutInflater;->createCustomViewInternal(Landroid/view/View;Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    invoke-static/range {v0 .. v5}, Lcom/mikepenz/iconics/context/InternalLayoutInflater;->access$000(Lcom/mikepenz/iconics/context/InternalLayoutInflater;Landroid/view/View;Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    .line 205
    invoke-virtual {v6, v0, p2, p3}, Lcom/mikepenz/iconics/context/IconicsFactory;->onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    .line 212
    :goto_1c
    return-object v0

    :cond_1d
    iget-object v0, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    iget-object v1, p0, Lcom/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory;->mFactory:Landroid/view/LayoutInflater$Factory;

    .line 213
    invoke-interface {v1, p1, p2, p3}, Landroid/view/LayoutInflater$Factory;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v1

    .line 212
    invoke-virtual {v0, v1, p2, p3}, Lcom/mikepenz/iconics/context/IconicsFactory;->onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    goto :goto_1c
.end method
