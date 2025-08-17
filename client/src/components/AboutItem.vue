<template>
  <div class="item">
    <div class="details">
      <h2>
        <slot name="heading"></slot>
      </h2>
      <slot></slot>
    </div>
  </div>
</template>

<style scoped>
.item {
  margin-top: 2rem;
  display: flex;
  position: relative;
}

.details {
  flex: 1;
  margin-left: 1rem;
}

h2 {
  font-size: 1.6rem;
  font-weight: 500;
  margin-bottom: 0.4rem;
  color: var(--color-heading);
}

:slotted(strong) {
  font-weight: bold;
}

:slotted(code) {
  font-family: monospace;
  color: var(--color-text);
  background-color: var(--color-background-mute);
  padding: 2px 4px;
  border-radius: 4px;
}
</style>
