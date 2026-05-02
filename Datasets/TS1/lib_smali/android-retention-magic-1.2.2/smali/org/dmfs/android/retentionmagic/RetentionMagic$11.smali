.class Lorg/dmfs/android/retentionmagic/RetentionMagic$11;
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
    .line 356
    invoke-direct {p0}, Lorg/dmfs/android/retentionmagic/PersistenceHelper;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public restoreFromBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 7
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
    .line 362
    invoke-virtual {p4, p3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p1, p2, v0, v1}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V

    .line 363
    return-void
.end method

.method public restoreFromPreferences(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/content/SharedPreferences;)V
    .registers 7
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
    .line 376
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-interface {p4, p3, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-virtual {p1, p2, v0, v1}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V

    .line 377
    return-void
.end method

.method public storeInBundle(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 7
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
    .line 369
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-virtual {p4, p3, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 370
    return-void
.end method

.method public storeInPreferences(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/content/SharedPreferences$Editor;)V
    .registers 7
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
    .line 383
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-interface {p4, p3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 384
    return-void
.end method
