.class Lorg/dmfs/android/retentionmagic/RetentionMagic$3;
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
    .line 145
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
    .line 151
    invoke-virtual {p4, p3}, Landroid/os/Bundle;->getByte(Ljava/lang/String;)B

    move-result v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->setByte(Ljava/lang/Object;B)V

    .line 152
    return-void
.end method

.method public restoreFromPreferences(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/content/SharedPreferences;)V
    .registers 6
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
    .line 165
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getByte(Ljava/lang/Object;)B

    move-result v0

    invoke-interface {p4, p3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->setByte(Ljava/lang/Object;B)V

    .line 166
    return-void
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
    .line 158
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getByte(Ljava/lang/Object;)B

    move-result v0

    invoke-virtual {p4, p3, v0}, Landroid/os/Bundle;->putByte(Ljava/lang/String;B)V

    .line 159
    return-void
.end method

.method public storeInPreferences(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;Landroid/content/SharedPreferences$Editor;)V
    .registers 6
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
    .line 172
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getByte(Ljava/lang/Object;)B

    move-result v0

    invoke-interface {p4, p3, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 173
    return-void
.end method
