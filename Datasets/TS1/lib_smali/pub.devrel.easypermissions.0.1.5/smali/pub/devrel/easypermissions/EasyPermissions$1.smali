.class final Lpub/devrel/easypermissions/EasyPermissions$1;
.super Ljava/lang/Object;
.source "EasyPermissions.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lpub/devrel/easypermissions/EasyPermissions;->requestPermissions(Ljava/lang/Object;Ljava/lang/String;III[Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callbacks:Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;

.field final synthetic val$perms:[Ljava/lang/String;

.field final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;I[Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 126
    iput-object p1, p0, Lpub/devrel/easypermissions/EasyPermissions$1;->val$callbacks:Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;

    iput p2, p0, Lpub/devrel/easypermissions/EasyPermissions$1;->val$requestCode:I

    iput-object p3, p0, Lpub/devrel/easypermissions/EasyPermissions$1;->val$perms:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 130
    iget-object v0, p0, Lpub/devrel/easypermissions/EasyPermissions$1;->val$callbacks:Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;

    iget v1, p0, Lpub/devrel/easypermissions/EasyPermissions$1;->val$requestCode:I

    iget-object v2, p0, Lpub/devrel/easypermissions/EasyPermissions$1;->val$perms:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;->onPermissionsDenied(ILjava/util/List;)V

    .line 131
    return-void
.end method
