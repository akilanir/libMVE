.class public interface abstract Lcom/octo/android/robospice/persistence/keysanitation/KeySanitizer;
.super Ljava/lang/Object;
.source "KeySanitizer.java"


# virtual methods
.method public abstract desanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;
        }
    .end annotation
.end method

.method public abstract sanitizeKey(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;
        }
    .end annotation
.end method
