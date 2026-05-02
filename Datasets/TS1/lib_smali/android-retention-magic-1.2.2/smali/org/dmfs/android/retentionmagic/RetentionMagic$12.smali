.class Lorg/dmfs/android/retentionmagic/RetentionMagic$12;
.super Lorg/dmfs/android/retentionmagic/PersistenceHelper;
.source "RetentionMagic.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/retentionmagic/RetentionMagic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 387
    invoke-direct {p0}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public restoreFromBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 6
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "instance"    # Ljava/lang/Object;
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 393
    invoke-virtual {p4, p3}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 394
    return-void
.end method

.method public restoreFromPreferences(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/content/SharedPreferences;)V
    .registers 11
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "instance"    # Ljava/lang/Object;
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "prefs"    # Landroid/content/SharedPreferences;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 437
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {p4, p3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 438
    .local v3, "longArrayPref":Ljava/lang/String;
    const/4 v2, 0x0

    .line 440
    .local v2, "longArray":[J
    if-eqz v3, :cond_20

    .line 442
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_33

    .line 444
    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 445
    .local v0, "arrayString":[Ljava/lang/String;
    array-length v4, v0

    new-array v2, v4, [J

    .line 446
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1d
    array-length v4, v2

    if-lt v1, v4, :cond_24

    .line 456
    .end local v0    # "arrayString":[Ljava/lang/String;
    .end local v1    # "i":I
    :cond_20
    :goto_20
    invoke-virtual {p1, p2, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 457
    return-void

    .line 448
    .restart local v0    # "arrayString":[Ljava/lang/String;
    .restart local v1    # "i":I
    :cond_24
    aget-object v4, v0, v1

    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    aput-wide v4, v2, v1

    .line 446
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    .line 453
    .end local v0    # "arrayString":[Ljava/lang/String;
    .end local v1    # "i":I
    :cond_33
    const/4 v4, 0x0

    new-array v2, v4, [J

    goto :goto_20
.end method

.method public storeInBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 6
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "instance"    # Ljava/lang/Object;
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 400
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    invoke-virtual {p4, p3, v0}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    .line 401
    return-void
.end method

.method public storeInPreferences(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/content/SharedPreferences$Editor;)V
    .registers 11
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "instance"    # Ljava/lang/Object;
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "editor"    # Landroid/content/SharedPreferences$Editor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 407
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v4, 0x400

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 408
    .local v0, "arrayStringBuilder":Ljava/lang/StringBuilder;
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [J

    .line 410
    .local v3, "longArray":[J
    if-eqz v3, :cond_31

    .line 412
    const/4 v1, 0x1

    .line 413
    .local v1, "first":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    array-length v4, v3

    if-lt v2, v4, :cond_1c

    .line 425
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p4, p3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 431
    .end local v1    # "first":Z
    .end local v2    # "i":I
    :goto_1b
    return-void

    .line 415
    .restart local v1    # "first":Z
    .restart local v2    # "i":I
    :cond_1c
    if-eqz v1, :cond_2b

    .line 417
    if-eqz v1, :cond_29

    const/4 v1, 0x0

    .line 423
    :goto_21
    aget-wide v4, v3, v2

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 413
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 417
    :cond_29
    const/4 v1, 0x1

    goto :goto_21

    .line 421
    :cond_2b
    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 429
    .end local v1    # "first":Z
    .end local v2    # "i":I
    :cond_31
    const/4 v4, 0x0

    invoke-interface {p4, p3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_1b
.end method
