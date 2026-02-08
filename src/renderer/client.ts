import '@whatsacomputertho/fbsim-ui/register';
import { WasmSimService } from '@whatsacomputertho/fbsim-ui';

const simService = new WasmSimService();

const gameSim = document.querySelector('wact-game-sim');
if (gameSim) {
  (gameSim as { setSimService: (s: WasmSimService) => void }).setSimService(simService);
}
