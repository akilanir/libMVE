.class public interface abstract Lcom/mikepenz/materialdrawer/model/interfaces/ColorfulBadgeable;
.super Ljava/lang/Object;
.source "ColorfulBadgeable.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Badgeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Badgeable",
        "<TT;>;"
    }
.end annotation


# virtual methods
.method public abstract getBadgeBackgroundResource()I
.end method

.method public abstract getBadgeTextColor()I
.end method

.method public abstract setBadgeBackgroundResource(I)V
.end method

.method public abstract setBadgeTextColor(I)V
.end method

.method public abstract withBadgeBackgroundResource(I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation
.end method

.method public abstract withBadgeTextColor(I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation
.end method
