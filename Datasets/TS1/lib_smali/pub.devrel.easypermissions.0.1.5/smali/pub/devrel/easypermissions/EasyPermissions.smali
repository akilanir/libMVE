.class public Lpub/devrel/easypermissions/EasyPermissions;
.super Ljava/lang/Object;
.source "EasyPermissions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "EasyPermissions"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;[Ljava/lang/String;I)V
    .registers 3
    .param p0, "x0"    # Ljava/lang/Object;
    .param p1, "x1"    # [Ljava/lang/String;
    .param p2, "x2"    # I

    .prologue
    .line 38
    invoke-static {p0, p1, p2}, Lpub/devrel/easypermissions/EasyPermissions;->executePermissionsRequest(Ljava/lang/Object;[Ljava/lang/String;I)V

    return-void
.end method

.method private static checkCallingObjectSuitability(Ljava/lang/Object;)V
    .registers 3
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 250
    instance-of v0, p0, Landroid/support/v4/app/Fragment;

    if-nez v0, :cond_10

    instance-of v0, p0, Landroid/app/Activity;

    if-nez v0, :cond_10

    .line 251
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Caller must be an Activity or a Fragment."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 255
    :cond_10
    instance-of v0, p0, Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;

    if-nez v0, :cond_1c

    .line 256
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Caller must implement PermissionCallbacks."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 258
    :cond_1c
    return-void
.end method

.method private static executePermissionsRequest(Ljava/lang/Object;[Ljava/lang/String;I)V
    .registers 4
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "perms"    # [Ljava/lang/String;
    .param p2, "requestCode"    # I

    .prologue
    .line 201
    invoke-static {p0}, Lpub/devrel/easypermissions/EasyPermissions;->checkCallingObjectSuitability(Ljava/lang/Object;)V

    .line 203
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_d

    .line 204
    check-cast p0, Landroid/app/Activity;

    .end local p0    # "object":Ljava/lang/Object;
    invoke-static {p0, p1, p2}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 208
    :cond_c
    :goto_c
    return-void

    .line 205
    .restart local p0    # "object":Ljava/lang/Object;
    :cond_d
    instance-of v0, p0, Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_c

    .line 206
    check-cast p0, Landroid/support/v4/app/Fragment;

    .end local p0    # "object":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Landroid/support/v4/app/Fragment;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_c
.end method

.method private static getActivity(Ljava/lang/Object;)Landroid/app/Activity;
    .registers 2
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 211
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_7

    .line 212
    check-cast p0, Landroid/app/Activity;

    .line 216
    .end local p0    # "object":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 213
    .restart local p0    # "object":Ljava/lang/Object;
    :cond_7
    instance-of v0, p0, Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_12

    .line 214
    check-cast p0, Landroid/support/v4/app/Fragment;

    .end local p0    # "object":Ljava/lang/Object;
    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p0

    goto :goto_6

    .line 216
    .restart local p0    # "object":Ljava/lang/Object;
    :cond_12
    const/4 p0, 0x0

    goto :goto_6
.end method

.method public static varargs hasPermissions(Landroid/content/Context;[Ljava/lang/String;)Z
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "perms"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 60
    array-length v5, p1

    move v4, v2

    :goto_4
    if-ge v4, v5, :cond_17

    aget-object v1, p1, v4

    .line 61
    .local v1, "perm":Ljava/lang/String;
    invoke-static {p0, v1}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_12

    move v0, v3

    .line 62
    .local v0, "hasPerm":Z
    :goto_f
    if-nez v0, :cond_14

    .line 67
    .end local v0    # "hasPerm":Z
    .end local v1    # "perm":Ljava/lang/String;
    :goto_11
    return v2

    .restart local v1    # "perm":Ljava/lang/String;
    :cond_12
    move v0, v2

    .line 61
    goto :goto_f

    .line 60
    .restart local v0    # "hasPerm":Z
    :cond_14
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .end local v0    # "hasPerm":Z
    .end local v1    # "perm":Ljava/lang/String;
    :cond_17
    move v2, v3

    .line 67
    goto :goto_11
.end method

.method public static onRequestPermissionsResult(I[Ljava/lang/String;[ILjava/lang/Object;)V
    .registers 10
    .param p0, "requestCode"    # I
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "grantResults"    # [I
    .param p3, "object"    # Ljava/lang/Object;

    .prologue
    .line 158
    invoke-static {p3}, Lpub/devrel/easypermissions/EasyPermissions;->checkCallingObjectSuitability(Ljava/lang/Object;)V

    move-object v0, p3

    .line 159
    check-cast v0, Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;

    .line 162
    .local v0, "callbacks":Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 163
    .local v2, "granted":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 164
    .local v1, "denied":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_11
    array-length v5, p1

    if-ge v3, v5, :cond_24

    .line 165
    aget-object v4, p1, v3

    .line 166
    .local v4, "perm":Ljava/lang/String;
    aget v5, p2, v3

    if-nez v5, :cond_20

    .line 167
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    :goto_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 169
    :cond_20
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 174
    .end local v4    # "perm":Ljava/lang/String;
    :cond_24
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2d

    .line 176
    invoke-interface {v0, p0, v2}, Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;->onPermissionsGranted(ILjava/util/List;)V

    .line 180
    :cond_2d
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_36

    .line 181
    invoke-interface {v0, p0, v1}, Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;->onPermissionsDenied(ILjava/util/List;)V

    .line 185
    :cond_36
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_45

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_45

    .line 186
    invoke-static {p3, p0}, Lpub/devrel/easypermissions/EasyPermissions;->runAnnotatedMethods(Ljava/lang/Object;I)V

    .line 188
    :cond_45
    return-void
.end method

.method public static varargs requestPermissions(Ljava/lang/Object;Ljava/lang/String;III[Ljava/lang/String;)V
    .registers 14
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "rationale"    # Ljava/lang/String;
    .param p2, "positiveButton"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p3, "negativeButton"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p4, "requestCode"    # I
    .param p5, "perms"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 109
    invoke-static {p0}, Lpub/devrel/easypermissions/EasyPermissions;->checkCallingObjectSuitability(Ljava/lang/Object;)V

    move-object v0, p0

    .line 110
    check-cast v0, Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;

    .line 112
    .local v0, "callbacks":Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;
    const/4 v3, 0x0

    .line 113
    .local v3, "shouldShowRationale":Z
    array-length v6, p5

    move v5, v4

    :goto_a
    if-ge v5, v6, :cond_1c

    aget-object v2, p5, v5

    .line 114
    .local v2, "perm":Ljava/lang/String;
    if-nez v3, :cond_16

    invoke-static {p0, v2}, Lpub/devrel/easypermissions/EasyPermissions;->shouldShowRequestPermissionRationale(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1a

    :cond_16
    const/4 v3, 0x1

    .line 113
    :goto_17
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    :cond_1a
    move v3, v4

    .line 114
    goto :goto_17

    .line 117
    .end local v2    # "perm":Ljava/lang/String;
    :cond_1c
    if-eqz v3, :cond_45

    .line 118
    new-instance v4, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-static {p0}, Lpub/devrel/easypermissions/EasyPermissions;->getActivity(Ljava/lang/Object;)Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 119
    invoke-virtual {v4, p1}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v5, Lpub/devrel/easypermissions/EasyPermissions$2;

    invoke-direct {v5, p0, p5, p4}, Lpub/devrel/easypermissions/EasyPermissions$2;-><init>(Ljava/lang/Object;[Ljava/lang/String;I)V

    .line 120
    invoke-virtual {v4, p2, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v5, Lpub/devrel/easypermissions/EasyPermissions$1;

    invoke-direct {v5, v0, p4, p5}, Lpub/devrel/easypermissions/EasyPermissions$1;-><init>(Lpub/devrel/easypermissions/EasyPermissions$PermissionCallbacks;I[Ljava/lang/String;)V

    .line 126
    invoke-virtual {v4, p3, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v4

    .line 132
    invoke-virtual {v4}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v1

    .line 133
    .local v1, "dialog":Landroid/support/v7/app/AlertDialog;
    invoke-virtual {v1}, Landroid/support/v7/app/AlertDialog;->show()V

    .line 137
    .end local v1    # "dialog":Landroid/support/v7/app/AlertDialog;
    :goto_44
    return-void

    .line 135
    :cond_45
    invoke-static {p0, p5, p4}, Lpub/devrel/easypermissions/EasyPermissions;->executePermissionsRequest(Ljava/lang/Object;[Ljava/lang/String;I)V

    goto :goto_44
.end method

.method public static varargs requestPermissions(Ljava/lang/Object;Ljava/lang/String;I[Ljava/lang/String;)V
    .registers 10
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "rationale"    # Ljava/lang/String;
    .param p2, "requestCode"    # I
    .param p3, "perms"    # [Ljava/lang/String;

    .prologue
    .line 84
    const v2, 0x104000a

    const/high16 v3, 0x1040000

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lpub/devrel/easypermissions/EasyPermissions;->requestPermissions(Ljava/lang/Object;Ljava/lang/String;III[Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method private static runAnnotatedMethods(Ljava/lang/Object;I)V
    .registers 11
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "requestCode"    # I

    .prologue
    const/4 v4, 0x0

    .line 221
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 222
    .local v1, "clazz":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v5

    array-length v6, v5

    :goto_a
    if-ge v4, v6, :cond_70

    aget-object v3, v5, v4

    .line 223
    .local v3, "method":Ljava/lang/reflect/Method;
    const-class v7, Lpub/devrel/easypermissions/AfterPermissionGranted;

    invoke-virtual {v3, v7}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_5b

    .line 225
    const-class v7, Lpub/devrel/easypermissions/AfterPermissionGranted;

    invoke-virtual {v3, v7}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lpub/devrel/easypermissions/AfterPermissionGranted;

    .line 226
    .local v0, "ann":Lpub/devrel/easypermissions/AfterPermissionGranted;
    invoke-interface {v0}, Lpub/devrel/easypermissions/AfterPermissionGranted;->value()I

    move-result v7

    if-ne v7, p1, :cond_5b

    .line 228
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    array-length v7, v7

    if-lez v7, :cond_4b

    .line 229
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "Cannot execute non-void method "

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_45

    invoke-virtual {v6, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_41
    invoke-direct {v5, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_45
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v6}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_41

    .line 234
    :cond_4b
    :try_start_4b
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->isAccessible()Z

    move-result v7

    if-nez v7, :cond_55

    .line 235
    const/4 v7, 0x1

    invoke-virtual {v3, v7}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 237
    :cond_55
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5b
    .catch Ljava/lang/IllegalAccessException; {:try_start_4b .. :try_end_5b} :catch_5e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4b .. :try_end_5b} :catch_67

    .line 222
    .end local v0    # "ann":Lpub/devrel/easypermissions/AfterPermissionGranted;
    :cond_5b
    :goto_5b
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 238
    .restart local v0    # "ann":Lpub/devrel/easypermissions/AfterPermissionGranted;
    :catch_5e
    move-exception v2

    .line 239
    .local v2, "e":Ljava/lang/IllegalAccessException;
    const-string v7, "EasyPermissions"

    const-string v8, "runDefaultMethod:IllegalAccessException"

    invoke-static {v7, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5b

    .line 240
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :catch_67
    move-exception v2

    .line 241
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v7, "EasyPermissions"

    const-string v8, "runDefaultMethod:InvocationTargetException"

    invoke-static {v7, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5b

    .line 246
    .end local v0    # "ann":Lpub/devrel/easypermissions/AfterPermissionGranted;
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_70
    return-void
.end method

.method private static shouldShowRequestPermissionRationale(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 3
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "perm"    # Ljava/lang/String;

    .prologue
    .line 191
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_b

    .line 192
    check-cast p0, Landroid/app/Activity;

    .end local p0    # "object":Ljava/lang/Object;
    invoke-static {p0, p1}, Landroid/support/v4/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    .line 196
    :goto_a
    return v0

    .line 193
    .restart local p0    # "object":Ljava/lang/Object;
    :cond_b
    instance-of v0, p0, Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_16

    .line 194
    check-cast p0, Landroid/support/v4/app/Fragment;

    .end local p0    # "object":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/support/v4/app/Fragment;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result v0

    goto :goto_a

    .line 196
    .restart local p0    # "object":Ljava/lang/Object;
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method
