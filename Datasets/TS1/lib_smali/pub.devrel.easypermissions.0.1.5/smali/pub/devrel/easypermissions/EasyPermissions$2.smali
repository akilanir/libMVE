.class final Lpub/devrel/easypermissions/EasyPermissions$2;
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
.field final synthetic val$object:Ljava/lang/Object;

.field final synthetic val$perms:[Ljava/lang/String;

.field final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Ljava/lang/Object;[Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 120
    iput-object p1, p0, Lpub/devrel/easypermissions/EasyPermissions$2;->val$object:Ljava/lang/Object;

    iput-object p2, p0, Lpub/devrel/easypermissions/EasyPermissions$2;->val$perms:[Ljava/lang/String;

    iput p3, p0, Lpub/devrel/easypermissions/EasyPermissions$2;->val$requestCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 123
    iget-object v0, p0, Lpub/devrel/easypermissions/EasyPermissions$2;->val$object:Ljava/lang/Object;

    iget-object v1, p0, Lpub/devrel/easypermissions/EasyPermissions$2;->val$perms:[Ljava/lang/String;

    iget v2, p0, Lpub/devrel/easypermissions/EasyPermissions$2;->val$requestCode:I

    # invokes: Lpub/devrel/easypermissions/EasyPermissions;->executePermissionsRequest(Ljava/lang/Object;[Ljava/lang/String;I)V
    invoke-static {v0, v1, v2}, Lpub/devrel/easypermissions/EasyPermissions;->access$000(Ljava/lang/Object;[Ljava/lang/String;I)V

    .line 124
    return-void
.end method
