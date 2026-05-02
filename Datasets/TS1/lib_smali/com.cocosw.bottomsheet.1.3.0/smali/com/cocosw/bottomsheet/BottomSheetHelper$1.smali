.class final Lcom/cocosw/bottomsheet/BottomSheetHelper$1;
.super Ljava/lang/Object;
.source "BottomSheetHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cocosw/bottomsheet/BottomSheetHelper;->shareAction(Landroid/app/Activity;Landroid/content/Intent;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$intent:Landroid/content/Intent;

.field final synthetic val$list:Ljava/util/List;


# direct methods
.method constructor <init>(Ljava/util/List;Landroid/content/Intent;Landroid/app/Activity;)V
    .registers 4

    .prologue
    .line 46
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheetHelper$1;->val$list:Ljava/util/List;

    iput-object p2, p0, Lcom/cocosw/bottomsheet/BottomSheetHelper$1;->val$intent:Landroid/content/Intent;

    iput-object p3, p0, Lcom/cocosw/bottomsheet/BottomSheetHelper$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 8
    .param p1, "dialog"    # Landroid/content/DialogInterface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "which"    # I

    .prologue
    .line 49
    iget-object v3, p0, Lcom/cocosw/bottomsheet/BottomSheetHelper$1;->val$list:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    iget-object v0, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 50
    .local v0, "activityInfo":Landroid/content/pm/ActivityInfo;
    new-instance v1, Landroid/content/ComponentName;

    iget-object v3, v0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v4, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v1, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .local v1, "name":Landroid/content/ComponentName;
    iget-object v3, p0, Lcom/cocosw/bottomsheet/BottomSheetHelper$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Intent;

    .line 53
    .local v2, "newIntent":Landroid/content/Intent;
    const/high16 v3, 0x10200000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 55
    invoke-virtual {v2, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 56
    iget-object v3, p0, Lcom/cocosw/bottomsheet/BottomSheetHelper$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v3, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 57
    return-void
.end method
