.class public Lcom/greysonparrelli/permiso/PermisoActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "PermisoActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 21
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    invoke-static {}, Lcom/greysonparrelli/permiso/Permiso;->getInstance()Lcom/greysonparrelli/permiso/Permiso;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/greysonparrelli/permiso/Permiso;->setActivity(Landroid/app/Activity;)V

    .line 23
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 5
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "grantResults"    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 33
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 34
    invoke-static {}, Lcom/greysonparrelli/permiso/Permiso;->getInstance()Lcom/greysonparrelli/permiso/Permiso;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/greysonparrelli/permiso/Permiso;->onRequestPermissionResult(I[Ljava/lang/String;[I)V

    .line 35
    return-void
.end method

.method protected onResume()V
    .registers 2

    .prologue
    .line 27
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 28
    invoke-static {}, Lcom/greysonparrelli/permiso/Permiso;->getInstance()Lcom/greysonparrelli/permiso/Permiso;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/greysonparrelli/permiso/Permiso;->setActivity(Landroid/app/Activity;)V

    .line 29
    return-void
.end method
