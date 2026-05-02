.class public Lorg/ligi/axt/extensions/ResolveInfoAXT;
.super Ljava/lang/Object;
.source "ResolveInfoAXT.java"


# instance fields
.field public final resolveInfo:Landroid/content/pm/ResolveInfo;


# direct methods
.method public constructor <init>(Landroid/content/pm/ResolveInfo;)V
    .registers 2
    .param p1, "resolveInfo"    # Landroid/content/pm/ResolveInfo;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lorg/ligi/axt/extensions/ResolveInfoAXT;->resolveInfo:Landroid/content/pm/ResolveInfo;

    .line 12
    return-void
.end method


# virtual methods
.method public getLabelSafely(Landroid/content/Context;)Ljava/lang/String;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 15
    iget-object v1, p0, Lorg/ligi/axt/extensions/ResolveInfoAXT;->resolveInfo:Landroid/content/pm/ResolveInfo;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 16
    .local v0, "charSequence":Ljava/lang/CharSequence;
    if-nez v0, :cond_f

    .line 17
    const-string v1, ""

    .line 19
    :goto_e
    return-object v1

    :cond_f
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method
