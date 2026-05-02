.class public Lcom/mikepenz/iconics/context/IconicsLayoutInflater;
.super Ljava/lang/Object;
.source "IconicsLayoutInflater.java"

# interfaces
.implements Landroid/support/v4/view/LayoutInflaterFactory;


# instance fields
.field private appCompatDelegate:Landroid/support/v7/app/AppCompatDelegate;

.field private final mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;


# direct methods
.method public constructor <init>(Landroid/support/v7/app/AppCompatDelegate;)V
    .registers 3
    .param p1, "appCompatDelegate"    # Landroid/support/v7/app/AppCompatDelegate;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/mikepenz/iconics/context/IconicsLayoutInflater;->appCompatDelegate:Landroid/support/v7/app/AppCompatDelegate;

    .line 18
    new-instance v0, Lcom/mikepenz/iconics/context/IconicsFactory;

    invoke-direct {v0}, Lcom/mikepenz/iconics/context/IconicsFactory;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/context/IconicsLayoutInflater;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    .line 19
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
    .line 23
    iget-object v1, p0, Lcom/mikepenz/iconics/context/IconicsLayoutInflater;->appCompatDelegate:Landroid/support/v7/app/AppCompatDelegate;

    invoke-virtual {v1, p1, p2, p3, p4}, Landroid/support/v7/app/AppCompatDelegate;->createView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    .line 24
    .local v0, "result":Landroid/view/View;
    iget-object v1, p0, Lcom/mikepenz/iconics/context/IconicsLayoutInflater;->mIconicsFactory:Lcom/mikepenz/iconics/context/IconicsFactory;

    invoke-virtual {v1, v0, p3, p4}, Lcom/mikepenz/iconics/context/IconicsFactory;->onViewCreated(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method
