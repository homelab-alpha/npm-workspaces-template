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
  <p :style="{ color: textColor }">{{ apiMessage }}</p>
</template>

<style scoped>
p {
  font-size: 1rem;
  line-height: 1.6;
  margin-top: 0;
  margin-bottom: 0;
  padding-top: 10px;
}
</style>
