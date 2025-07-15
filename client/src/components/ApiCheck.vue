<script setup lang="ts">
import { computed, onMounted, ref } from "vue";

const apiMessage = ref("Loading...");
const apiStatus = ref<"loading" | "online" | "offline">("loading");

const emit = defineEmits(["update:status"]);

const textColor = computed(() => {
  if (apiStatus.value === "online") {
    return "hsla(160, 100%, 37%, 1)";
  } else if (apiStatus.value === "offline") {
    return "hsla(0, 100%, 37%, 1)";
  } else {
    return "hsla(210, 100%, 50%, 1)";
  }
});

onMounted(async () => {
  try {
    const response = await fetch("http://localhost:3210/api/hello");
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const data = await response.json();
    apiMessage.value = data.message;
    apiStatus.value = "online";
    emit("update:status", "online");
  } catch (error) {
    console.error("Error fetching API message:", error);
    apiMessage.value =
      "Unable to reach the API. Please ensure the backend server is running and accessible.";
    apiStatus.value = "offline";
    emit("update:status", "offline");
  }
});
</script>

<template>
  <h3 :style="{ color: textColor }">{{ apiMessage }}</h3>
</template>

<style scoped>
h3 {
  font-size: 1.2rem;
  font-weight: 500;
  margin-top: 1rem;
  margin-bottom: 0.4rem;
}
</style>
